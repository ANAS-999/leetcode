import math


class Solution:
    def climbStairs(self, n: int) -> int:
        count: int = 0

        for i in range(n + 1):
            for j in range(n + 1):
                eq = i + 2*j

                if eq > n:
                    break

                if eq == n:
                    i_path = [1] * i
                    j_path = [2] * j
                    path: list[int] = i_path + j_path

                    if i != 0 and j != 0:
                        order: int = int(math.factorial(
                            len(path)) / (math.factorial(len(i_path)) * math.factorial(len(j_path))))

                        count += order
                        print(f"+{order}", path)
                    else:
                        count += 1
                        print("+1", path)

        return count


if __name__ == "__main__":
    n: int = 45
    count: int = Solution().climbStairs(n)

    print(f"For n={n} there is {count} way.")
