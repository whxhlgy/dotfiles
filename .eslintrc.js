module.exports = {
  "env": {
      "browser": true,
      "es2021": true
  },
  "extends": "semistandard",
  "rules" : {
    "space-before-function-paren": ["error", {
      "anonymous": "always",
      "named": "never",
      "asyncArrow": "never"
    }],
  }
};
