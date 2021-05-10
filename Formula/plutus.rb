class Plutus < Formula
  desc "plutus-cli from binaries"
  homepage "https://better.com"
  version "0.46.5"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.5/bin/darwin-x64", :using => :nounzip
    sha256 "3ed0fb5e883bec7d1d1b7b1697b21e8394bbef6e778ec8b5a20e629e4f688aee"
    $executable_name = "darwin-x64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v0.46.5/bin/linux-x64", :using => :nounzip
    sha256 "826130c3a345fec281b6c69ab083681d041ddd001a44de0aad9dd5fafd24ca7b"
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
