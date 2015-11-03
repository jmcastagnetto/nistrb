# nistrb - A package to access the NIST Randomness Beacon

This package implements R functions and an S3 class to access the
NIST the NIST Randomness Beacon, through its REST web service interface.

The NIST service <q>generates full-entropy bit-strings and posts them in blocks
of 512 bits every 60 seconds</q>^[https://beacon.nist.gov/home]

## Implementation details

According to the beacon's documentation, there are five endpoints defined and
this package wraps the call to each one in a function:

- `nrb_get_last()`: `https://beacon.nist.gov/rest/record/last` (Last Record)
- `nrb_get_next(timestamp)`: `https://beacon.nist.gov/rest/record/next/<timestamp>` (Next Record)
- `nrb_get_previous(timestamp)`: `https://beacon.nist.gov/rest/record/previous/<timestamp>` (Previous Record)
- `nrb_get_record(timestamp)`: `https://beacon.nist.gov/rest/record/<timestamp>` (Current Record or next closest to `timestamp`)
- `nrb_get_start_chain(timestamp)`: `https://beacon.nist.gov/rest/record/start-chain/<timestamp>` (Start of Chain Record)

The result of calling an endpoint is returned as an object of class `nrb_response`.

For example, to get the record generated on Jan 1, 2015 at 10:00h (UTC), we will
use the following code:

```{r}
library(nistrb)
ts <- as.POSIXct("2015-01-01 10:00:00", tz = "UTC")
lval <- nrb_get_record(ts)
lval
```

The last line prints:

```
NIST Randomness Beacon Response
===============================

* version:      Version 1.0
* frequency:    60 seconds

* timestamp:    2015-01-01 05:00:00 (1420106400)
* seed:         037035A8D1F2C74D6E233F6B962E7A7233BBAF67A1B0247A81
                29E0BB50D619144A4083A5375A1BC16731FFB83357DD5CC1A9
                62523370453E6707E74762B515D6
                
* prev.:        368D684FB8DC709852C0E67ECA439774AF8C7D21CFAB73083A
                1C0120C340B54C3237E1FB73C78B739884E05D8D11BA17AB9C
                F10EEA3C37CBDEB888888486BD4F
                
* signature:    20F647B95F5A56DDBEA82044821DC022EB4CC0B53700CD6351
                4CC02D320B42DAA684A1FFA9B8635E8BEE58A35DDDC899FB84
                16BD08AE57EFBF26A2325E2334F1CC5B5B0126AF0866443215
                7DE6C9FD58F857340D46DBAF902FD5D7770BFBB8755279EB92
                D4787655B5A5658DFC97EB9209D4AC271EF30D5BDBCAAE2F37
                5144BEEF5CB17A9CF37C52648ED0BC682ACFF147D2CA8CCC39
                9253B351660261A6CF80A166089EA54E7F425B652C6417735C
                2BE01414515481B05CC359836F0261CF1D7F1FC23BC0FA1A52
                125455755CDF2DEECE5D4555883897E8DCD9FB564A868A0007
                5489EA28D01949A56FD4BC5AFC14AB6766C80BECB69F31CB0D
                DFA47FA59703
                
* output:       27DADEBF52C5834E1894B99625845689C7BFC1ABD05CC672B1
                AC8A6A585424BC4C6E577C0249FBAFBDC589CD6937BEBBA764
                7E1233692D2003237598F12FF342
                
* status:       0 (Chain intact, values all good
```

