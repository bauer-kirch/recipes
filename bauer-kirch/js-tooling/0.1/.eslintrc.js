module.exports = {
  root: true,
  env: {
    browser: true,
    es6: true,
  },
  extends: [
    'airbnb-base',
    'plugin:eslint-comments/recommended',
    'plugin:jest/recommended',
    'plugin:promise/recommended',
    'plugin:vue/recommended',
    // prettier needs to go last
    'prettier',
  ],
  plugins: ['vue', 'jest', 'prettier'],
  parser: 'vue-eslint-parser',
  parserOptions: {
    ecmaVersion: 2019,
    sourceType: 'module',
  },
  rules: {
    curly: ['error', 'all'],
    'prettier/prettier': 'error',
    'eslint-comments/no-unused-disable': 'error',
    'promise/prefer-await-to-then': 'error',
    'promise/prefer-await-to-callbacks': 'error',
    'import/prefer-default-export': 'off',
    'import/no-mutable-exports': 'error',
    'import/exports-last': 'error',
    /*
     * To allow camel case prop names, this rule needs to be disabled, because
     * it enforces "my-prop" instead of "myProp".
     */
    'vue/attribute-hyphenation': [0, { ignore: ['custom-prop'] }],
  },
};
