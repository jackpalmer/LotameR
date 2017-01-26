# LotameR

### What is LotameR?

**LotameR** is an R package to interact with the Lotame API.

# Installation

The package can be installed using the following code:

```r
library(devtools)
install_github(c("jackpalmer/LotameR", "jackpalmer/LotameR"))
```

After installation, the package can be loaded into R.

```r
library(LotameR)
```

# Using LotameR

To start generate a ticket granting ticket, which is valid for 3 hours.

```r
ticket <- lotame_ticket("username","password")
```

# Bug reports

Report bugs as issues on the [GitHub repository](https://github.com/jackpalmer/LotameR)
