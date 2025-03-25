# mouseAge

## Description
The `mouseAge` repository provides functions to convert mouse ages to equivalent human ages. This is based on the study described in [this publication](https://doi.org/10.1016/j.lfs.2015.10.025). The functions account for different units of age including days, weeks, months, and years, and provide approximate human age equivalents for given mouse ages.

## Features
- Convert mouse age to human age in various units (days, weeks, months, years).
- Handles multiple age units for input and output.

## Installation
To use the functions provided in this repository, you need to have R installed on your system. You can download R from [CRAN](https://cran.r-project.org/).

Once R is installed, you can source the script to load the functions into your R environment:
```R
remotes::install_github("JonSulc/mouseAge")
```
## Usage
The functions in this repository convert mouse age to human age in various units. The function suffixes indicate the units of the age in input and output, e.g., to_human_age_my converts a mouse's age in months to human age in years. The unit abbreviations are:

- `d`: days
- `w`: weeks (7 days)
- `m`: months (365 / 12 = 30.42 days)
- `y`: years (365 days)

For example:
- `to_human_age_dd`: Converts mouse age in days to human age in days.
- `to_human_age_dm`: Converts mouse age in days to human age in months.
- `to_human_age_yy`: Converts mouse age in years to human age in years.

## Examples
```R
# Convert 42 days of mouse age to human age in years
human_age <- to_human_age_dy(42)
print(human_age)

# Convert 2 years of mouse age to human age in years
human_age <- to_human_age_yy(2)
print(human_age)
```

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue if you have suggestions for improvements or find bugs.

## License
This project is licensed under the GPL3 License. See the LICENSE file for more details.

## References
https://doi.org/10.1016/j.lfs.2015.10.025
