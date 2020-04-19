#include <array>
#include <execution>
#include <functional>
#include <iostream>
#include <numeric>

int main()
{
    std::array<std::function<void(void)>, 4> messages =
    {
        []() { std::cout << "Hello, "; },
        []() { std::cout << "World! "; },
        []() { std::cout << "From "; },
        []() { std::cout << "CMake!"; }
    };

    const auto combine = [](auto fn1, auto fn2)
    {
        return std::function<void(void)>{[=]()
        {
            fn1();
            fn2();
        }};
    };

    std::function<void(void)> default = []() {};

    auto greeting = std::reduce(std::execution::par_unseq, std::cbegin(messages), std::cend(messages), default, combine);
    greeting();

    std::cin.get();
}