%define name me-centos
%define version 2.5.1
%define release 1

Name: me-centos	
Version: 1.0	
Release: 1%{?dist}
Summary: Joyent Machine Extras for Centos

Group:Administration
License: MIT
URL: http://wiki.joyent.com/jpc2/Centos
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
Vendor: Joyent, Inc

%description
These are the necessary files required by Joyent in order to run on SmartOS.

%prep
exit 0

%build
exit 0

%install
exit 0

%clean
exit 0

%files
%defattr(-,root,root)
/etc/acpi/events/powerbtn-acpi-support
/lib/smartdc
/usr/sbin/mdata-get
/usr/sbin/mdata-list
/usr/sbin/mdata-put
/usr/sbin/mdata-delete
/usr/share/man/man1/mdata-get.1
/usr/share/man/man1/mdata-list.1
/usr/share/man/man1/mdata-put.1
/usr/share/man/man1/mdata-delete.1
