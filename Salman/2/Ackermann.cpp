#include <iostream>
#include <stack>

using namespace std;

/**
 * @brief Calculates the Ackermann function recursively.
 *
 * @param m The first parameter of the Ackermann function.
 * @param n The second parameter of the Ackermann function.
 * @return int The result of the Ackermann function.
 */
int A(int m, int n)
{
    if (m == 0)
    {
        return n + 1;
    }
    else if (m > 0 && n > 0)
    {
        return A(m - 1, A(m, n - 1));
    }
    else if (m > 0 && n == 0)
    {
        return A(m - 1, 1);
    }
    return 0;
}

/**
 * @brief Calculates the Ackermann function iteratively using a stack.
 *
 * @param m The first parameter of the Ackermann function.
 * @param n The second parameter of the Ackermann function.
 * @return int The result of the Ackermann function.
 */
int A2(int m, int n)
{
    stack<int> thels; // Stack to store intermediate values of m

    while (true)
    {
        if (m > 0 && n == 0)
        {
            m--;
            n = 1;
        }
        else if (m > 0 && n > 0)
        {
            thels.push(m - 1);
            n--;
        }
        else if (!thels.empty())
        {
            m = thels.top();
            thels.pop();
            n++;
        }
        else
        {
            break;
        }
    }

    return n + 1;
}

int main()
{
    // Example usage of the A() function
    int resultRecursive = A(3, 2);
    cout << "Result of A(3, 2) using recursion: " << resultRecursive << endl;

    // Example usage of the A2() function
    int resultIterative = A2(3, 2);
    cout << "Result of A2(3, 2) using iteration: " << resultIterative << endl;

    return 0;
}