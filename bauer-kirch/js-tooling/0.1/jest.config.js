const { defaults } = require('jest-config');

module.exports = {
    verbose: true,
    moduleFileExtensions: [...defaults.moduleFileExtensions, 'vue'],
    testMatch: ['**/*.test.js'],
    transform: {
        '^.+\\.js$': 'babel-jest',
        '^.+\\.ts$': 'babel-jest',
        '^.+\\.vue$': 'vue-jest',
        '.+\\.(css|styl|less|sass|scss|svg|png|jpg|ttf|woff|woff2)$':
            'jest-transform-stub',
    },
    transformIgnorePatterns: [
        'node_modules/(?!(babel-jest|jest-vue-preprocessor)/)',
    ],
    cacheDirectory: '<rootDir>/node_modules/.cache/jest',
    collectCoverageFrom: ['assets/**/*.{js,ts,vue}'],
    coverageThreshold: {
        global: {
            statements: 50,
        },
    },
};
