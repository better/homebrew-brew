class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.0.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "cf84312824e72707ecc29387b46fb49b414ec995b0f3790234851b9b7d7b69ef"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "54937b2e11a8cce1740e622c5fbf4c1bcd39106bc7b2a95cf9c4f2ae3f395492"
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
