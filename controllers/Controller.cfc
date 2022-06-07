/**
 * This is the parent controller file that all your controllers should extend.
 * You can add functions to this file to make them available in all your controllers.
 *
 * Do not delete this file.
 *
 * NOTE: When extending this controller and implementing `config()` in the child controller, don't
 * forget to call this base controller's `config()` via `super.config()`, or else the call to
 * `protectsFromForgery` below will be skipped.
 *
 * Example controller extending this one:
 *
 * component extends="Controller" {
 *   function config() {
 *     // Call parent constructor
 *     super.config();
 *
 *     // Your own init logic here.
 *     // ...
 *   }
 * }
 */
component extends="wheels.Controller" {
	function config() {
		protectsFromForgery();
	}

	function f_getVersions(){
		versions=getAvailableVersions();
	}
}
