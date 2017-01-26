# LotameR

### What is LotameR?

**LotameR** is an R package to interact with the Lotame API.

Full interative documentation for the Lotame API can be found [here](https://api.lotame.com/docs/). To request an additional function to this package please submit an issue. Documentation is currently a work in progress, but all functions should include options as listed within the API documentation.

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

To return a list of audiences in the client account call:

```r
audiences <- lotame_audiences(client_id = "client_id")
```

To generate a list of

```r
affinity_data <- lotame_audience_affinity(audience_id = "audience_id",
                                          sort_attr = "index30",
                                          paginate_query = TRUE)
```

# Bug reports

Report bugs as issues on the [GitHub repository](https://github.com/jackpalmer/LotameR)
