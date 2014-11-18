## Lintian

	vifros: no-md5sums-control-file
	N:
	N:    This package does not contain an md5sums control file. This control file
	N:    listing the MD5 checksums of the contents of the package is not
	N:    required, but if present debsums can use it to verify that no files
	N:    shipped with your package have been modified. Providing it is
	N:    recommended.
	N:
	N:    If you are using debhelper to create your package, just add a call to
	N:    dh_md5sums at the end of your binary-indep or binary-arch target, right
	N:    before dh_builddeb.