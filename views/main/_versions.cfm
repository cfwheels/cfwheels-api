<cfparam name="versions">
<cfoutput>
<div id="versions" class="panel panel-default">
  <div class="panel-body">
  	<div class="form-group">
		<label>Version</label>
		<select name="versioncontrol" id="versioncontrol" class="form-control">
			<cfloop from="1" to="#arraylen(versions)#" index="v">
				<option value="#versions[v]#" <cfif replace(params.version, 'v', '', 'all') EQ versions[v]>selected</cfif>>#versions[v]#</option>
			</cfloop>
		</select>
	</div>
	</div>
</div>
</cfoutput>
