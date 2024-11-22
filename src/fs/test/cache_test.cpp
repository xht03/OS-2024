#include "cache_test.hpp"

void run_test(const char* name, void (*test)())
{
    printf("Running test: %s\n", name);
    test();
    printf("Test passed\n");
}

int main()
{
    std::vector<Testcase> tests = {
        { "init", basic::test_init },
        { "read_write", basic::test_read_write },
        { "loop_read", basic::test_loop_read },
        { "reuse", basic::test_reuse },
        { "lru", basic::test_lru },
        { "atomic_op", basic::test_atomic_op },
        { "overflow", basic::test_overflow },
        { "resident", basic::test_resident },
        { "local_absorption", basic::test_local_absorption },
        { "global_absorption", basic::test_global_absorption },
        { "replay", basic::test_replay },
        { "alloc", basic::test_alloc },
        { "alloc_free", basic::test_alloc_free },

        { "concurrent_acquire", concurrent::test_acquire },
        { "concurrent_sync", concurrent::test_sync },
        { "concurrent_alloc", concurrent::test_alloc },

        { "simple_crash", crash::test_simple_crash },
        { "single", [] { crash::test_parallel(1000, 1, 5, 0); } },
        { "parallel_1", [] { crash::test_parallel(1000, 2, 5, 0); } },
        { "parallel_2", [] { crash::test_parallel(1000, 4, 5, 0); } },
        { "parallel_3", [] { crash::test_parallel(500, 4, 10, 1); } },
        { "parallel_4",
          [] { crash::test_parallel(500, 4, 10, 2 * OP_MAX_NUM_BLOCKS); } },
        { "banker", crash::test_banker },
    };
    Runner(tests).run();
    printf("(info) OK: %zu tests passed.\n", tests.size());

    // run_test("init", basic::test_init);
    // run_test("read_write", basic::test_read_write);
    // run_test("loop_read", basic::test_loop_read);
    // run_test("reuse", basic::test_reuse);
    // run_test("lru", basic::test_lru);
    // run_test("atomic_op", basic::test_atomic_op);
    // run_test("overflow", basic::test_overflow);
    // run_test("resident", basic::test_resident);
    // run_test("local_absorption", basic::test_local_absorption);
    // run_test("global_absorption", basic::test_global_absorption);
    // run_test("replay", basic::test_replay);
    // run_test("alloc", basic::test_alloc);
    // run_test("alloc_free", basic::test_alloc_free);

    // run_test("concurrent_acquire", concurrent::test_acquire);
    // run_test("concurrent_sync", concurrent::test_sync);
    // run_test("concurrent_alloc", concurrent::test_alloc);

    // run_test("simple_crash", crash::test_simple_crash);
    // run_test("single", [] { crash::test_parallel(1000, 1, 5, 0); });
    // run_test("parallel_1", [] { crash::test_parallel(1000, 2, 5, 0); });
    // run_test("parallel_2", [] { crash::test_parallel(1000, 4, 5, 0); });
    // run_test("parallel_3", [] { crash::test_parallel(500, 4, 10, 1); });
    // run_test("parallel_4", [] { crash::test_parallel(500, 4, 10, 2 * OP_MAX_NUM_BLOCKS); });
    // run_test("banker", crash::test_banker);

    return 0;
}
