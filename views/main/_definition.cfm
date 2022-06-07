<cfoutput>
<cfset meta=docs.functions[func]>
	<div id="#lcase(meta.name)#"
		data-section="#meta.tags.sectionClass#"
		data-category="#meta.tags.categoryClass#"
		data-function="#lcase(meta.slug)#"
		class="functiondefinition">


			<h3 class="functitle">#linkTo(route="docFunction", version=params.version, slug=meta.slug, format="html", text=meta.name & "()")# <span class="dropdown ">
		  <button id="dLabel#func#" type="button" class="btn btn-xs btn-default" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

		    <span class="caret"></span>
		  </button>
		  <ul class="dropdown-menu" aria-labelledby="dLabel#func#">
		    <li>#linkTo(route="docFunction", version=params.version, encode="attributes", slug=meta.slug, format="html", text="<i class='fa fa-anchor'></i> Permalink")#</li>
		    <li>#linkTo(route="docFunction", version=params.version, encode="attributes", slug=meta.slug, format="json", text="<i class='fa fa-code'></i> JSON")#</li>
		  </ul>
		</span></h3>
			<p>
			<cfif len(meta.tags.section)>
				<a href="" class="filtersection tag btn btn-xs btn-default" title="Show all Functions in this category">
				<i class="fa fa-tag"></i> #meta.tags.section#</a>
			</cfif>
			<cfif len(meta.tags.category)>
				<a href="" class="filtercategory tag btn btn-xs btn-default" title="Show all Functions in this category">
				<i class="fa fa-tag"></i> #meta.tags.category#</a>
			</cfif>
			<cfif structKeyExists(meta, "returnType") && len(meta.returnType)>
				<span class="tag btn btn-xs btn-default"><i class="fa fa-reply"></i> #meta.returnType#</span>
			</cfif>
			<cfif structKeyExists(meta, "availableIn") && arrayLen(meta.availableIn)>
				<cfloop from="1" to="#arrayLen(meta.availableIn)#" index="a">
					<span class="tag btn btn-xs btn-default"><i class="fa fa-bolt"></i> #meta.availableIn[a]#</span>
				</cfloop>
			</cfif>
			  </p>
			<cfif structKeyExists(meta, "hint")>
				<div class="hint">#$hintOutput(meta.hint)#</div>
			</cfif>

			<cfif isArray(meta.parameters) && arraylen(meta.parameters)>
				<table class="table table-condensed">
				<thead>
					<tr>
						<th>Name</th>
						<th>Type</th>
						<th>Required</th>
						<th>Default</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
				<cfloop from="1" to="#arraylen(meta.parameters)#" index="p">
				<cfset _param=meta.parameters[p]>
					<cfif !left(_param.name, 1) EQ "$">
						<tr>
							<td class='code'>#_param.name#</td>
							<td class='code'>#_param.type#</td>
							<td class='code'>#YesNoFormat(_param.required)#</td>
							<td class='code'>
							<cfif
								structKeyExists(application.wheels.functions, func)
								AND structKeyExists(application.wheels.functions[func], _param.name)>
								#application.wheels.functions[func][_param.name]#
							</cfif>
							<cfif structkeyExists(_param, "default")>#_param.default#</cfif></td>
							<td><cfif structkeyExists(_param, "hint")>#$backTickReplace(_param.hint)#</cfif></td>
						</tr>
					</cfif>
				</cfloop>
				</tbody>
				</table>
			</cfif>

			<cfif meta.extended.hasExtended>
				<div class="md">#meta.extended.docs#</div>
			</cfif>

		</div><!--/ #lcase(meta.name)# -->
</cfoutput>
