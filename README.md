## strdate

**strdate** converts a text string into a date:

```R
> strdate::strdate("now")
[1] "2016-06-05 14:33:54 CDT"
> strdate::strdate("3 minutes from now")
[1] "2016-06-05 14:34:33 CDT"
> strdate::strdate("1 day from now")
[1] "2016-06-06 14:30:55 CDT"
> strdate::strdate("3 minutes ago")
[1] "2016-06-05 14:28:35 CDT"
> strdate::strdate("3 minutes from now")
[1] "2016-06-05 14:34:36 CDT"
> strdate::strdate("1 day and 3 minutes from now")
[1] "2016-06-05 14:34:44 CDT"
```

#### Acknowledgements

Code was taken from [Robert Krzyzanowski](https://github.com/robertzk)'s [testthatsomemore](https://github.com/robertzk/testthatsomemore) package, with permission.
