class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.0.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "42475145e6ef518e9d2dfbb19b1a7dbd98d4cb8f9054c16a1f2d6ff5aad55d41"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "5388df2f7ea36b45d96b22f7df68be7f641e1582faae88ce380956501977e9f0"
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
