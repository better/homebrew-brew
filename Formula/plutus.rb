class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.39.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "fdb8c9cc5fa7d94987de4baeca8c54fb27919e26ad23aaf5c3bd7bb4de8da5bb"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "480484e5d8bc91632604ef780ee9917c085833529de0ae96efe2d39cda0c6f66"
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
