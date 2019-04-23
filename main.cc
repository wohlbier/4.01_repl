#include <cilk.h>
#include <memoryweb.h>
#include <string>




typedef long Index_t;






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

class Matrix_t : public repl_new
{
public:
    static Matrix_t * create(Index_t nrows)
    {
        return new Matrix_t(nrows);
    }

    Matrix_t() = delete;
    Matrix_t(const Matrix_t &) = delete;
    Matrix_t & operator=(const Matrix_t &) = delete;
    Matrix_t(Matrix_t &&) = delete;
    Matrix_t & operator=(Matrix_t &&) = delete;

    void allocateRow(Index_t i)  
    {
        rows_[i] = new long;
    }

    long * nodelet_addr(long i)
    {
        // dereferencing causes migrations
        return (long *)(rows_ + i);
    }

  
private:
    Matrix_t(Index_t nrows) : nrows_(nrows)
    {
        rows_ = (long **)mw_malloc1dlong(nrows_);

        // replicate the class across nodelets
        for (Index_t i = 1; i < NODELETS(); ++i)
        {
            memcpy(mw_get_nth(this, i), mw_get_nth(this, 0), sizeof(*this));
        }
       









    }







    Index_t nrows_;
    Index_t ** rows_;
};


int main(int argc, char* argv[])
{
    starttiming();

    Index_t nrows = 8;
    
    Matrix_t * A = Matrix_t::create(nrows);

    // local mallocs on nodelet 2 and 5

    cilk_migrate_hint(A->nodelet_addr(2));
    cilk_spawn A->allocateRow(2);

    cilk_migrate_hint(A->nodelet_addr(5));
    cilk_spawn A->allocateRow(5);

    cilk_sync;
    
    return 0;
}
