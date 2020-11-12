**Questions before defining test strategy**
- Why should the test strategy document be created? Who will use it?
- What do we know about target users? (e.g. should we test accessibility for the handicapped or the hearing-/visually impaired?)
- Where do the users live? Should we test Arabic numeral system or right-to-left layout?
- Are there any non-obvious functional requirements?
- What is the development process? How many developers work on the app? Should the tests be ran on CI?


**Questions before creating proper assertions in automated tests**
- What is the maximum number supported by the app?
- Comma button doesn’t work and the app only supports integers. Since there are no requirements regarding floating-point value presentation (e.g. digit grouping, decimal/period/space separators), it’s hard to create proper test assertions.
- Should the app support landscape mode?
- What should the app’s behaviour be when dividing by 0? Currently the app crashes.
- Should the app support copy-pasting (clipboard)?


**To Do**
- Add tests for percent button
- Test the app in landscape mode (if required)
- Test different numeral systems (if required)
- Test copy-pasting (if required)
- Performance, stress testing (if necessary)
- Test calculation interruption (when the app goes to background and then back to foreground)
- Calculate test coverage (if necessary)
- Big numbers are currently truncated, which is a bug. Autoshrink is needed. Verification ideas:
  * Screenshot testing.
  * Checking the number box’s height (which should shrink as the number gets bigger).
  * Somehow hooking into production code and checking if UILabel truncates the text. I’m not sure as my iOS dev knowledge is limited.
Test on different devices (OS versions, screen sizes)
