# rule-605

Did you want to do something with SEC rule 605 reports? Are you a disciple of the church of "shove everything into sqlite and ask questions about it later"? Well, this script is a hacky, one-off shortcut to let you do exactly that.

# Usage

1. Go get some rule 605 reports. Specifically, you're looking for mysterious `.dat` files, which are (hopefully) structured according to the format awkwardly defined in the [Joint-SRO Plan Appendix A](https://www.sec.gov/interps/legal/slbim12rappxa.htm). You can nab a lot of these from [this portal](https://vrs.vista-one-solutions.com/sec605rule.aspx).

2. Add as many as you like to a sqlite database with `./import.sh new-or-existing-db-file.db some-rule-605-report.dat`

3. Make whatever queries you like; executions are in the `executions` table. Check the `codes` table for conversion between human-readable strings and type codes.





