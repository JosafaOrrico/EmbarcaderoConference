{******************************************************************************}
{                                                                              }
{  Delphi SwagDoc Library                                                      }
{  Copyright (c) 2018 Marcelo Jaloto                                           }
{  https://github.com/marcelojaloto/SwagDoc                                    }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}

unit Json.Schema.Field.Strings;

interface

uses
  System.Json,
  Json.Schema.Field,
  Json.Schema.Common.Types;

type
  [ASchemaType(skString)]
  TJsonFieldString = class(TJsonField)
  strict private
    fMinLength: Integer;
    fMaxLength: Integer;
  public
    constructor Create; override;
    function ToJsonSchema: TJsonObject; override;
    function Clone: TJsonField; override;

    property MinLength: Integer read fMinLength write fMinLength;
    property MaxLength: Integer read fMaxLength write fMaxLength;
  end;

  [ASchemaType(skGuid)]
  TJsonFieldGuid = class(TJsonField);

implementation

uses
  System.Classes,
  Json.Commom.Helpers;

{ TJsonFieldString }

function TJsonFieldString.Clone: TJsonField;
begin
  Result := inherited Clone;
  TJsonFieldString(Result).MinLength := Self.fMinLength;
  TJsonFieldString(Result).MaxLength := Self.fMaxLength;
end;

constructor TJsonFieldString.Create;
begin
  inherited Create;
  fMinLength := 0;
  fMaxLength := 0;
end;

function TJsonFieldString.ToJsonSchema: TJsonObject;
begin
  Result := inherited ToJsonSchema;
  if (fMinLength > 0) then
    Result.AddPair('minLength', fMinLength);
  if (fMaxLength > 0) then
    Result.AddPair('maxLength', fMaxLength);
end;

initialization
  RegisterClass(TJsonFieldString);
  RegisterClass(TJsonFieldGuid);

end.
