class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.29.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "2b87eca3b9d9107b34ec8a0e744f93476f2d53b417e8212dc8cbf7abfb23f8f1"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "674449f2d1b7c73f634ffe9f82229bb143a3412187e4f6944d539cf2217b572e"
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
