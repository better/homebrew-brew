class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.36.2"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "9acbea7b61377a0c20ec2862880a23efa1508971756d7eba71f1349852628da4"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "9caac39512d27c8b9bc53b2a1dddb73c3483d245ff0c34ff72fba1fa69bfa9b5"
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
