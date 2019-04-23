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
    static my_t * create_my_t(long n)
    {
        return new my_t(n);
    }

    void fn(long i)
    {
        a_[i] = new long;
    }

    my_t() = delete; // if needed, put as private
    my_t(const my_t &) = delete;
    my_t & operator=(const my_t &) = delete;
    my_t(my_t &&) = delete;
    my_t & operator=(my_t &&) = delete;

    long * nodelet_addr(long i)
    {
        // dereferencing causes migrations
        return (long *)(a_ + i);
    }
    
private:
    my_t(long n) : n_(n)
    {

        a_ = (long **)mw_malloc1dlong(n_);

        // replicate the class across nodelets
        for (long i = 1; i < NODELETS(); ++i)
        {
            memcpy(mw_get_nth(this, i), mw_get_nth(this, 0), sizeof(*this));
        }
    }

    long n_;
    long ** a_;
};


int main(int argc, char* argv[])
{
    starttiming();

    long n = 8;

    //my_t B(n);

    // instance created on nodelet 0
    my_t * A = my_t::create_my_t(n);

    long i = 2; // nodelet 2
    // - migrate 0 => 2
    // - migrate 2 => 0 from main thread returning to 0
    cilk_migrate_hint(A->nodelet_addr(i)); // no migration, do not deref a_
    // - migrate 2 => 0 from spawned thread returning to 0

    cilk_spawn A->fn(i);

    cilk_sync;
    
    return 0;
}
