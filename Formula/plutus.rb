class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.44.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "0b0c0aecfe47aacfb4bce767612171507f2b5f2673b1e8cb3d152de415d35562"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "bff91b943bc1bee7c6ed85e776e82dc1cd99ff4b08266c36a4bf7a5b7bba1cb7"
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
