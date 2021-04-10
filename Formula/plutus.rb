class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.37.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "887ae52f9322a086a3a4e100d9b8f3d03be40495c9a1cf4ef27fd6056f416a19"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "d7e60edef1a2a37184ba22c8c5ff02c52b1b0d3498006487e397a5b90f8ac7c8"
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
