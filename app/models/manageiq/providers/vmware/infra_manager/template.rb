class ManageIQ::Providers::Vmware::InfraManager::Template < ManageIQ::Providers::InfraManager::Template
  include_concern 'ManageIQ::Providers::Vmware::InfraManager::VmOrTemplateShared'

  supports :provisioning do
    if ext_management_system
      if !ext_management_system.supports_provisioning?
        unsupported_reason_add(:provisioning, ext_management_system.unsupported_reason(:provisioning))
      end
    else
      unsupported_reason_add(:provisioning, _('not connected to ems'))
    end
  end

  def cloneable?
    true
  end
end
