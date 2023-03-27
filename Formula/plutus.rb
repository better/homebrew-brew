class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.34.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "00d699118ba62b8bab547b10e84d5651ffa0a1b11d6ccabff0ab16608aa14dd7"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "920313c1a830f0b6bea7f6f13566c6b725cbeeb5271e5bc38f9938589b234810"
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
