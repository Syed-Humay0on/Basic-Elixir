![Elixir Learning Banner](https://miro.medium.com/v2/resize:fit:640/format:webp/1*sibZGERFV7n0oDxZj1sP6A.png)
---

# My Elixir Learning Journey 🚀

## Core Concepts
* **Pattern Matching (`=`):** It's not assignment; it's a "shape match."
* **Immutability:** You never change data; you transform it into new data.
* **The Pipe (`|>`):** Data flows top-to-bottom like an assembly line.
* **Recursion:** How we loop in Elixir. Always need a **Base Case**!
* **Actor Model:** Processes are isolated islands. They don't share memory; they send messages.

## Syntax Quick Reference
| Feature | Syntax |
| :--- | :--- |
| **Modules** | `defmodule Name do ... end` |
| **Functions** | `def function_name(arg) do ... end` |
| **Sending Msg** | `send(pid, {:tag, data})` |
| **Receiving** | `receive do {:tag, data} -> ... end` |
| **List Head/Tail** | `[head | tail] = [1, 2, 3]` |

## The Golden Rule of Recursion
1. **Base Case:** The condition that STOPS the recursion (e.g., `def sum([]), do: 0`).
2. **Recursive Step:** The condition that CALLS the function again with smaller data.

## 📖 The Roadmap
**[View the full 15-day plan →](ROADMAP.md)**

## 🚀 Quick Start
```bash
# Run Day 1
elixir lib/day01.ex
