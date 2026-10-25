# typed: strict
# frozen_string_literal: true

# Homebrew formula for the native macOS MacNotif executable.
class Macnotif < Formula
  desc "Lightweight macOS HUD for temporary and permanent notices"
  homepage "https://github.com/Thames1990/macnotif"
  version "1.1.0"

  depends_on macos: :sequoia

  on_macos do
    on_arm do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/macnotif-#{version}-arm64.tar.gz"
      sha256 "616a61df8390c3044a9ec5e56dff63a5f1a5154c729d41a5c90516aa64d47f7e"
    end

    on_intel do
      url "https://github.com/Thames1990/homebrew-tap/releases/download/v#{version}/macnotif-#{version}-x86_64.tar.gz"
      sha256 "a148404750e01e07f8e09e63aba39c620c1154a681699b2184cafe27fca56a51"
    end
  end

  def install
    bin.install "macnotif"
  end

  test do
    ENV["HOME"] = testpath
    ENV["CFFIXED_USER_HOME"] = testpath
    system bin/"macnotif", "--clear"
    assert_predicate testpath/"Library/Application Support/MacNotif", :directory?
  end
end
