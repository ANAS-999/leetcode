class Solution:
    def calculate(self, x: str, y: str, op: str) -> int:
        x = int(x)
        y = int(y)

        match op:
            case "+":
                return int(x + y)
            case "-":
                return int(x - y)
            case "*":
                return int(x * y)
            case "/":
                return int(x / y)

    def is_int(self, str: str) -> bool:
        try:
            int(str)
            return True
        except:
            return False

    def get_op_index(self, tokens: list[int]) -> int:
        for i in range(len(tokens)):
            if not self.is_int(tokens[i]):
                return i

    def evalRPN(self, tokens: list[str]) -> int:
        if len(tokens) == 1:
            return int(tokens[0])

        op_index = self.get_op_index(tokens)
        num_1 = tokens[op_index - 2]
        num_2 = tokens[op_index - 1]
        result = self.calculate(num_1, num_2, tokens[op_index])

        tokens[op_index] = result
        tokens.pop(op_index-1)
        tokens.pop(op_index-2)

        return self.evalRPN(tokens)


if __name__ == "__main__":
    tokens = ["10", "6", "9", "3", "+", "-11",
              "*", "/", "*", "17", "+", "5", "+"]
    result = Solution().evalRPN(tokens)

    print(result)
