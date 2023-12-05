---
title: "Recursive Application"
categories:
  - Software Development
tags:
  - Java
  - Algorithms and Data Structures
  - Coding Tutorials
math: true
---


![Recursive Application Illustration](/assets/images/recursive-app.png){: .left width="470" height="470"}
<span style="font-size: 27px; font-style: italic;">
    Today, we will create a recursive app and learn the logic of recursive algorithms.
    The project contains 32 recursive algorithms and is resilient to errors made by the user.
</span>


<span style="font-size: 23px;font-style: italic;">
    <b>Project GitHub Link:</b>
    <a href="https://github.com/MervanKanat/RecursiveApp">Visit the Project on GitHub</a>
</span>

<br>

## Formula for Factorial Calculation :

<br>

<div style="font-size: larger;">
$$
n! = 
\begin{cases} 
1 & \text{if } n = 0, \\
n \times (n-1)! & \text{otherwise.}
\end{cases}
$$
</div>

<br><br>


## Understanding Recursive Algorithms Through Factorial Calculation

Let's take the calculation of factorial as an example to understand how a recursive algorithm works. Here is a step-by-step explanation using the calculation of 3 factorial \(3!\):

| Function Call     | Operation             | Result | Explanation                                             |
|-------------------|-----------------------|--------|---------------------------------------------------------|
| `factorial(3)`    | `3 * factorial(2)`    | -      | Calls factorial for 2, waits for the result             |
| `factorial(2)`    | `2 * factorial(1)`    | -      | Calls factorial for 1, waits for the result             |
| `factorial(1)`    | `1 * factorial(0)`    | -      | Calls factorial for 0, waits for the result             |
| `factorial(0)`    | `1`                   | 1      | Base case reached, returns 1                            |
| Return to `factorial(1)` | `1 * 1`         | 1      | Returns 1 to the previous call                          |
| Return to `factorial(2)` | `2 * 1`         | 2      | Returns 2 to the previous call                          |
| Return to `factorial(3)` | `3 * 2`         | 6      | Returns 6 as the final result of `factorial(3)`         |

This table demonstrates how the `factorial(3)` function works in a recursive manner. Initially, `factorial(3)` is called, and it subsequently calls `factorial(2)`, `factorial(1)`, and `factorial(0)`. The function `factorial(0)` is the base case and returns 1. Then, each function returns its result to the function that called it, leading to the final result.


### Continuing with Examples from Our Project
Next, let's explore another example from our project. Here's the printBinary function, which converts an integer to its binary representation using recursion:

 ```bash
public static void printBinary(int n) {
    if (n == 0) {
        return;
    } else {
        printBinary(n / 2);
        System.out.print(n % 2);
    }
}
```
### How the `printBinary` Function Works:

1. **Base Case**:
   - The function starts by checking if the input `n` is 0. This is the base case of our recursion. If `n` is indeed 0, the function returns immediately, preventing any further recursive calls.

2. **Recursive Call**:
   - If `n` is not 0, the function proceeds to call itself with the argument `n / 2`. This division by 2 is crucial as it reduces the size of the problem and moves the function closer to the base case.

3. **Print Binary Digit**:
   - Following each recursive call, the function prints the remainder when `n` is divided by 2 (`n % 2`). This action is key to printing the binary digits in the correct order, as the last recursive call completes first.

4. **Overall Process**:
   - The function continually calls itself with a progressively smaller value of `n`, printing the remainder at each step. This approach effectively assembles the binary representation of the original number in reverse order, resulting in the correct binary output.
