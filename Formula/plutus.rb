class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.4"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "24cb5b2b89311a16b557fd5753404b984de37d2c5a4c0cff7efbd06cc67e8927"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "b7742903c365e2173b503163bc735b5479cbf539d7adfb88e85bcc561f9a2dc9"
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
