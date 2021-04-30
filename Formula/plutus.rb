class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  version "0.45.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "f5473bb6b68f7de46a9290ba272d44aa4dbe8f2baac15b84393318f3c8645256"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "70f0cc26b43c945adc9edf4b5b01e317aec7815ce855447a149e931839a58856"
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
