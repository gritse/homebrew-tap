class DotenvCrypt < Formula
  desc "Encrypt individual values in .env files using AES-256-GCM with macOS Keychain"
  homepage "https://github.com/gritse/dotenv-crypt"
  url "https://github.com/gritse/dotenv-crypt/archive/refs/tags/v0.3.tar.gz"
  sha256 "980ea6c679e714c4d8957decb179f44da799041da51edee547b50c53de58f7cb"
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
