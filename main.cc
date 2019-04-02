#include <string>
#include <cilk.h>
#include <memoryweb.h>

/*
 * Overrides default new to always allocate replicated storage for instances
 * of this class. repl_new is intended to be used as a parent class for
 * distributed data structure types.
 */
class repl_new
{
public:
    // Overrides default new to always allocate replicated storage for
    // instances of this class
    static void *
    operator new(std::size_t sz)
    {
        return mw_mallocrepl(sz);
    }
    
    // Overrides default delete to safely free replicated storage
    static void
    operator delete(void * ptr)
    {
        mw_free(ptr);
    }
};

class my_t : public repl_new
{
public:
    my_t(long n) : n_(n)
    {
        a_ = (long **)mw_malloc1dlong(n_);
        
        // replicate the class across nodelets
        for (long i = 1; i < NODELETS(); ++i)
        {
            memcpy(mw_get_nth(this, i), mw_get_nth(this, 0), sizeof(*this));
        }
    }

    void fn(long i)
    {
        // If nothing is in this function, then
        // - migrate 0 => 2
        // - migrate 2 => 0 from main thread
        // - migrate 2 => 0 from spawned thread

        // I would have thought that adding the line below would not cause
        // additional migrations since the class is replicated, i.e.,
        // a_[i] would be a local operation.
        // However, it adds an additional migration 2 => 0 and
        // an additional migration 0 => 2.
        // Is it going to get the main thread instance of A or something?
        a_[i] = new long;
    }

    long * nodelet_addr(long i)
    {
        // dereferencing causes migrations
        return (long *)(a_ + i);
    }
    
private:

    long n_;
    long ** a_;
};


int main(int argc, char* argv[])
{
    starttiming();

    long n = 8;
    // instance created on nodelet 0
    my_t A(n);

    long i = 2; // nodelet 2
    cilk_migrate_hint(A.nodelet_addr(i)); // no migration, do not deref a_
    cilk_spawn A.fn(i);

    cilk_sync;
    
    return 0;
}
