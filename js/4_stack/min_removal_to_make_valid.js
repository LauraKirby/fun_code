var minRemoveToMakeValid = function (s) {
  const stack = [];
  const splitted_str = s.split("");
  for (let i = 0; i < s.length; i++) {
    const char = s[i];
    if (char === "(")
      stack.push(i); // if curr char is (  then we will push into our stack
    else if (char === ")") {
      if (stack.length === 0) {
        // if out stack is empty then we will make ) as ''
        splitted_str[i] = "";
      } else {
        //! if stack is not empty then we will pop top of the stack
        stack.pop();
      }
    }
  }
  // if we have extra ( bracket we will remove it by making it as ''
  for (let i = 0; i < stack.length; i++) {
    const char = stack[i];
    splitted_str[char] = "";
  }

  return splitted_str.join(""); // at last we will join the splitted_str
};
