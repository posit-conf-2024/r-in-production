---
format: gfm
---

R in Production
================

### posit::conf(2024)

by Hadley Wickham

-----

:spiral_calendar: August 12, 2024
:alarm_clock:     09:00 - 17:00
:hotel:           ROOM TBD
:writing_hand:    [pos.it/conf](http://pos.it/conf)

-----

## Description

What it means to put R in production varies tremendously from organisation to organisation.
However, I believe that there are common principles that you can learn to improve your code, regardless of the precise details of what production means for your organisation.

This workshop is organised around three big differences between running a local script on your computer and putting your code into production:

-   **Not just once**: production code isn't a one-off script; it runs repeatedly, and needs to run reliably even as the environment around it (e.g. R package versions and input data) changes. How can you ensure that code continues to run reliably months and years after you wrote it, and when there's a problem it clearly reports on it.
-   **Not just your computer**: production code doesn't run on your computer. It typically runs on some other server where you can't interactively experiment. This poses particular challenges for authentication and debugging.
-   **Not just you**: the responsibility for production code is typically shared across a team. How can you ensure that you're all working together as effectively as possible, sharing code and best practices, and continuing to get better at your job over time.

## Audience

This course is for you if you:

-   Get frustrated debugging R code that's running on another computer.

-   Struggle keep your code running reliably as packages and data change over time.

-   Want to generally improve the quality of your production code.

To be successful in this course you need to be familiar with R and Git.

## Prework

1. `install.packages("pak")`
2. `pak::pak(c("usethis", "pointblank", "logger", "nanoparquet"))`
3. Make sure you have the latest version of quarto (1.5)
4. Sign up for a a free GitHub account if you don't already.
5. Sign up for a free [Posit Connect Cloud](https://connect.posit.cloud/) account.
6. Sign up for a free [NewsAPI](https://newsapi.org) account.

## Schedule

| Time          | Activity         |
| :------------ | :--------------- |
| 09:00 - 10:30 | [The whole game](materials/1-whole-game.pdf)        |
| 10:30 - 11:00 | *Coffee break*   |
| 11:00 - 12:30 | [Code is run on another machine](materials/2-another-server.pdf)        |
| 12:30 - 13:30 | *Lunch break*    |
| 13:30 - 15:00 | [Code is run repeatedly](materials/3-run-repeatedly.pdf)        |
| 15:00 - 15:30 | *Coffee break*   |
| 15:30 - 17:00 | [Code (and data) is a shared responsibility](materials/4-shared-responsibility.pdf)        |


-----

![](https://i.creativecommons.org/l/by/4.0/88x31.png) This work is
licensed under a [Creative Commons Attribution 4.0 International
License](https://creativecommons.org/licenses/by/4.0/).
