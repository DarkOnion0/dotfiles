{pkgs, ...}: {
  permittedInsecurePackages = [
    "openssl-1.1.1t"
    "openssl-1.1.1u"
  ];
}
