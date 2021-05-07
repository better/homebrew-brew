class PlutusBin < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.45.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.45.3/bin/darwin-x64", :using => :nounzip
    sha256 "ab1e8fd708c03cef332b20d70a0407e5ed014be7404a4b21e5e3b08dfef937da"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.45.3/bin/linux-x64", :using => :nounzip
    sha256 "fdc9a8cc7f844af2b650de1623e5f5cc22716aad8992db6990076dfa5456f82a"
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
