# TON compile
This project is a compilation note for [The Open Network](https://github.com/ton-blockchain/ton).

* This project currently describes operating system environment.
  * `Ubuntu 18.04`, 
  * `Ubuntu 22.04`, 
  * `Apple M1`
* The compiler mainly uses `make` or `ninja`

At present, `ninja` is recommended, and in the best case, it can shorten the compilation time by 40%.

the following are the results of the experiment.

|           | cmake-ninja-Precompiled(s) | cmake-Precompiled(s) | ninja-compiled(s) | make-compiled(s) | performance improvement |
|-----------|----------------------------|----------------------|-------------------|------------------|-------------------------|
| m1-max(1) | 5                          | 6                    | 147               | 165              |                         |
| m1-max(2) | 5                          | 6                    | 148               | 164              |                         |
| m1-max(3) | 6                          | 6                    | 149               | 164              |                         |
| m1-max(4) | 6                          | 6                    | 147               | 161              |                         |
| average   | 5.5                        | 6                    | 147.75            | 163.5            | 10%                     |
|           |                            |                      |                   |                  |                         |
| 3990x(1)  | 3                          | 3                    | 69                | 116              |                         |
| 3990x(2)  | 2                          | 3                    | 70                | 115              |                         |
| 3990x(3)  | 3                          | 3                    | 68                | 115              |                         |
| 3990x(4)  | 3                          | 4                    | 69                | 116              |                         |
| average   | 2.75                       | 3.25                 | 69                | 115.5            | 40%                     |