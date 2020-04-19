#include "Benchmark.h"

static void Mark(benchmark::State& state)
{
    for (auto _ : state)
        std::string empty_string;
}

BENCHMARK(Mark);