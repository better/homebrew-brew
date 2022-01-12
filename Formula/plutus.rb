class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.22.0"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "14ac267f05ff4e9cdc26f02c596a7721e58758b4780560e9a7c89565067d3f33"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "dc0c0252d53d9ef45a05a6bb7eebd120972bb7de26b612cf3424fbc5f1f32bca"
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
