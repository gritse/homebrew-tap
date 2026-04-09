class DotenvCrypt < Formula
  desc "Encrypt individual values in .env files using AES-256-GCM with macOS Keychain"
  homepage "https://github.com/gritse/dotenv-crypt"
  url "https://github.com/gritse/dotenv-crypt/archive/refs/tags/v0.2.tar.gz"
  sha256 "6fa45abd9e77ea1d36daaf371f41750c680374be3ab277d85dcdd02d6ad767bf"
  license "GPL-2.0-only"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/dotenv-crypt"
  end

  test do
    assert_match "USAGE: dotenv-crypt", shell_output("#{bin}/dotenv-crypt --help 2>&1")
  end
end
