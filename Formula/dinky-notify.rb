# typed: strict
# frozen_string_literal: true

# Homebrew formula for the native macOS dinky-notify executable.
class DinkyNotify < Formula
  desc "Small macOS HUD for Dinky mode indicators and temporary notifications"
  homepage "https://github.com/Thames1990/dinky-notify"
  version "1.0.0"

  depends_on macos: ">= :sequoia"

  on_macos do
    on_arm do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/dinky-notify-#{version}-arm64.tar.gz"
      sha256 "abb2b5316b1e4aaca569d6b284d77df3cb9e5c9c901aba7bbdbb6ca3fe6ae5cc"
    end

    on_intel do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/dinky-notify-#{version}-x86_64.tar.gz"
      sha256 "7de78db2726c6f74c5d4f9dfd41a3c7b3e879e30508a8bd142e64e5bd852ff63"
    end
  end

  def install
    bin.install "dinky-notify"
  end

  test do
    ENV["HOME"] = testpath
    ENV["CFFIXED_USER_HOME"] = testpath
    system bin/"dinky-notify", "end"
    assert_predicate testpath/"Library/Application Support/DinkyModeHUD", :directory?
  end
end
