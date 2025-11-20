-- Patch nvim-java's mason integration to avoid API compatibility issues
-- This overrides the mason utility functions that check package versions
local M = {}

function M.apply_patch()
  -- Pre-load and override the mason utility module BEFORE nvim-java requires it
  -- Don't touch mason-registry in the patch itself to avoid triggering the API issue

  -- Create patched mason utility module
  local patched_mason = {
    -- Always return true for is_available to skip version checks
    is_available = function(package_name, package_version)
      return true
    end,

    -- Check if installed without calling get_installed_version
    is_installed = function(package_name, package_version)
      -- Lazily require mason only when this function is called
      local mason_ok, mason_reg = pcall(require, 'mason-registry')
      if not mason_ok then
        return false
      end

      local has_pkg = mason_reg.has_package(package_name)
      if not has_pkg then
        return false
      end

      local pkg = mason_reg.get_package(package_name)
      -- Only check if installed, don't check version (avoids the API issue)
      return pkg:is_installed()
    end,

    -- Never report packages as outdated
    is_outdated = function(packages)
      return false
    end,

    -- Don't try to install packages
    install_pkgs = function(packages)
      -- No-op: assume packages are already installed via mason
    end,

    -- No-op for registry refresh
    refresh_registry = function()
      -- No-op
    end,
  }

  -- Preload the patched module so nvim-java uses it
  package.preload['java.utils.mason'] = function()
    return patched_mason
  end

  vim.notify("Applied nvim-java mason patch", vim.log.levels.DEBUG)
  return true
end

return M
