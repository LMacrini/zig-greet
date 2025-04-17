{
  pkgs,
  zig,
}:
pkgs.mkShell {
  name = "zig greet";

  packages = [
    pkgs.git
    zig.default
  ];
}
