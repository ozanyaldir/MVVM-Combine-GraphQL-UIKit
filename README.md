## Developer Notes

- Project is written in MVVM design pattern because there is only one flow, didn't prepare any coordinators to manage scenes and navigations. (I usuially prefer MVVM-C design pattern.)
- There is no external libraries used in the project. Does not require install pods or dependecies etc.
- There is no external library used for networking to keep the original request structure. For GraphQL, I usually use Apollo iOS Client or for Rest API's I usually use Moya.
- For reactive development I used Combine framework.
- I mostly tried to continue developing the project with existing ways (Developed UI using only code, Made the networking withoud libraries etc.).
- I have left comments to the lines that would be optimized or missing.
- For the lack of time I didn't develop in a TDD way. After adding UI tests, I couldn't find the time to add Unit tests.
- I will be sending the project in a .zip file because forking the repository was not allowed.
- You can find my changes under `ozanyaldir` branch.