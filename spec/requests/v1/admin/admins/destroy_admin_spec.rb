# frozen_string_literal: true

require 'rails_helper'

describe 'DELETE /admin/admins/:isbn' do
  let!(:admin_edit) { create(:admin) }
  let!(:admin_manager) { create(:manager) }

  context 'when successful' do
    let(:headers_with_authorization) do
      base_headers.tap { |hash| hash['Authorization'] = "Bearer #{jwt_token}" }
    end

    it do
      expect do
        delete(admin_admin_path(admin_edit.id), headers: headers_authorization(base_headers, admin_manager))
      end.to change(Admin, :count).from(2).to(1)

      expect(response).to have_http_status(:no_content)
      expect(response.body).to be_blank
    end
  end

  context 'when error' do
    context 'when unauthorized error' do
      let(:expected_response) do
        {
          errors: [
            {
              title: 'Unauthorized',
              detail: 'Invalid Email or password.',
              code: 'unauthorized'
            }
          ],
          meta: {}
        }
      end

      it do
        expect do
          delete(admin_admin_path(admin_edit.id), headers: base_headers)
        end.not_to change(Admin, :count)

        expect(response).to have_http_status(:unauthorized)
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when forbidden error' do
      let(:expected_response) do
        {
          errors: [
            {
              title: 'Not authorized',
              detail: 'User not authorized.',
              code: 'forbidden'
            }
          ],
          meta: {}
        }
      end

      it do
        expect do
          delete(admin_admin_path(admin_edit.id), headers: headers_authorization(base_headers, admin_edit))
        end.not_to change(Admin, :count)

        expect(response).to have_http_status(:forbidden)
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when not found error' do
      let(:expected_response) do
        {
          errors: [
            {
              title: 'Resource not found',
              detail: "The Admin '00000000-0000-0000-0000-000000000000' is not found",
              code: 'resource_not_found'
            }
          ],
          meta: {}
        }
      end

      it do
        expect do
          delete(admin_admin_path(invalid_uuid), headers: headers_authorization(base_headers, admin_manager))
        end.not_to change(Admin, :count)

        expect(response).to have_http_status(:not_found)
        expect(parsed_response).to eq(expected_response)
      end
    end
  end
end
