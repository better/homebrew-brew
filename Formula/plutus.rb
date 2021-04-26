class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.43.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "b8304b61e9c30b9696e45b7efa72589edda86d9f3ec68f8fd638147cb2c47d7f"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "feb02ff03030543c2be35bcdd5eea3f9c2819544f9876db9ae338c7bb2fa8f3f"
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
