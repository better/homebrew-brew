class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.40.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "6f72cf028dd30cd31ba3de1dba7bcd7e330887da2edc1431f3b0e87cb9c77b91"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "b195a5bf7083c81768f50ceddf44f734d6e1adb5011027c9dca60d57e37b1846"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
