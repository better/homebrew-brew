class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.0/bin/darwin-x64", :using => :nounzip
    sha256 "c832cc6733f564bd110c70706e30293a00b7b4bdea7333eaa8f1859546993fe2"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.0/bin/linux-x64", :using => :nounzip
    sha256 "835661efc6bc2aaff548a825b16d4021a74949a17eef959179ab846287b147cd"
    $executable_name = "linux-x64"
  end

  def install
    mv $executable_name, name
    system "chmod", "+x", name
    libexec.install name
    bin.install_symlink libexec/name
  end

  test do
    system bin/name, "version"
  end
end
