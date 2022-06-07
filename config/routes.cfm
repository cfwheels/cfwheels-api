<cfscript>

	/**
	 * Here you can add routes to your application and point the root route to a different
	 * controller/action.
	 *
	 * See http://docs.cfwheels.org/docs/using-routes for more info.
	 */
	mapper()
		//.get(name="permalink", pattern="/[version]/[slug].[format]", to="main##show")
		.get(name="docFunction", pattern="/*[version]/*[slug]/.[format]", to="main##show")
		.get(name="docFunction", pattern="/*[version]/*[slug]/", to="main##show")
		.get(name="docVersion", pattern="/*[version]/", to="main##index")
		.root(to="main##root", method="get")
	.end();

</cfscript>
